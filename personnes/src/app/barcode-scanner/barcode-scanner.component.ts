import {
  Component,
  Output,
  EventEmitter,
  ViewChild,
  ElementRef,
  AfterViewInit,
  OnDestroy,
  NgZone,
} from '@angular/core';
import { CommonModule } from '@angular/common';

declare const BarcodeDetector: any;

@Component({
  selector: 'app-barcode-scanner',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div
      class="fixed inset-0 z-50 bg-black/90 flex items-center justify-center p-4"
      (click)="close()"
    >
      <div class="relative w-full max-w-sm" (click)="$event.stopPropagation()">

        <!-- Header -->
        <div class="flex items-center justify-between mb-4">
          <div class="flex items-center gap-2">
            <div class="w-2 h-2 rounded-full bg-violet-400 animate-pulse"></div>
            <p class="text-white font-semibold text-sm">Scanner un code-barre</p>
          </div>
          <button
            (click)="close()"
            class="w-8 h-8 flex items-center justify-center rounded-full bg-white/10 hover:bg-white/20 text-white transition-all"
          >
            <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
            </svg>
          </button>
        </div>

        <!-- Viewfinder -->
        <div class="relative rounded-2xl overflow-hidden bg-zinc-900 aspect-[4/3]">
          <video #videoEl autoplay playsinline muted class="w-full h-full object-cover"></video>

          <!-- Cadre de scan -->
          <div class="absolute inset-0 flex items-center justify-center pointer-events-none">
            <div class="relative w-64 h-28">
              <!-- Coins du cadre -->
              <div class="absolute top-0 left-0 w-6 h-6 border-t-2 border-l-2 border-violet-400 rounded-tl-lg"></div>
              <div class="absolute top-0 right-0 w-6 h-6 border-t-2 border-r-2 border-violet-400 rounded-tr-lg"></div>
              <div class="absolute bottom-0 left-0 w-6 h-6 border-b-2 border-l-2 border-violet-400 rounded-bl-lg"></div>
              <div class="absolute bottom-0 right-0 w-6 h-6 border-b-2 border-r-2 border-violet-400 rounded-br-lg"></div>
              <!-- Ligne de scan animée -->
              <div *ngIf="scanning" class="absolute left-2 right-2 h-0.5 bg-violet-400/70 rounded scan-line"></div>
            </div>
          </div>

          <!-- Overlay succès -->
          <div
            *ngIf="detected"
            class="absolute inset-0 bg-emerald-500/20 flex items-center justify-center"
          >
            <div class="w-16 h-16 rounded-full bg-emerald-500 flex items-center justify-center shadow-lg shadow-emerald-500/40">
              <svg class="w-8 h-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M5 13l4 4L19 7"/>
              </svg>
            </div>
          </div>
        </div>

        <!-- Message statut -->
        <div class="mt-4 text-center min-h-[20px]">
          <p *ngIf="scanning" class="text-zinc-400 text-xs">Pointez vers le code-barre...</p>
          <p *ngIf="detected" class="text-emerald-400 text-sm font-semibold">Code détecté !</p>
          <p *ngIf="errorMsg" class="text-rose-400 text-xs">{{ errorMsg }}</p>
        </div>

      </div>
    </div>
  `,
  styles: [`
    @keyframes scanMove {
      0%   { top: 8px; }
      50%  { top: calc(100% - 10px); }
      100% { top: 8px; }
    }
    .scan-line {
      animation: scanMove 2s ease-in-out infinite;
    }
  `]
})
export class BarcodeScannerComponent implements AfterViewInit, OnDestroy {
  @ViewChild('videoEl') videoEl!: ElementRef<HTMLVideoElement>;
  @Output() barcodeScanned = new EventEmitter<string>();
  @Output() closed = new EventEmitter<void>();

  scanning = false;
  detected = false;
  errorMsg = '';

  private stream: MediaStream | null = null;
  private detector: any = null;
  private rafId: number | null = null;

  constructor(private zone: NgZone) {}

  ngAfterViewInit() {
    this.startCamera();
  }

  async startCamera() {
    if (typeof BarcodeDetector === 'undefined') {
      this.errorMsg = 'Non supporté sur ce navigateur. Utilisez Chrome (Android ou Desktop).';
      return;
    }
    try {
      this.stream = await navigator.mediaDevices.getUserMedia({
        video: { facingMode: 'environment' }
      });
      this.videoEl.nativeElement.srcObject = this.stream;
      await this.videoEl.nativeElement.play();
      this.detector = new BarcodeDetector({
        formats: ['ean_13', 'ean_8', 'code_128', 'qr_code', 'upc_a', 'upc_e', 'code_39', 'itf']
      });
      this.zone.run(() => { this.scanning = true; });
      this.scan();
    } catch {
      this.zone.run(() => {
        this.errorMsg = 'Accès caméra refusé. Autorisez la caméra dans les paramètres du navigateur.';
      });
    }
  }

  private async scan(): Promise<void> {
    if (!this.scanning || !this.detector) return;
    try {
      const barcodes = await this.detector.detect(this.videoEl.nativeElement);
      if (barcodes.length > 0) {
        this.zone.run(() => {
          this.scanning = false;
          this.detected = true;
          this.barcodeScanned.emit(barcodes[0].rawValue);
        });
        setTimeout(() => this.close(), 600);
        return;
      }
    } catch { /* frame pas encore prête */ }
    this.rafId = requestAnimationFrame(() => this.scan());
  }

  close() {
    this.scanning = false;
    if (this.rafId) { cancelAnimationFrame(this.rafId); this.rafId = null; }
    if (this.stream) { this.stream.getTracks().forEach(t => t.stop()); this.stream = null; }
    this.closed.emit();
  }

  ngOnDestroy() {
    this.close();
  }
}
