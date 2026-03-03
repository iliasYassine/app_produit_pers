import { ApplicationConfig } from '@angular/core';
import { provideRouter } from '@angular/router';

import { routes } from './app.routes';
import { provideClientHydration, withNoHttpTransferCache } from '@angular/platform-browser';
import { provideHttpClient, withInterceptors } from '@angular/common/http';
import { noCacheInterceptor } from './no-cache.interceptor';

export const appConfig: ApplicationConfig = {

  providers: [provideRouter(routes), provideClientHydration(withNoHttpTransferCache()), provideHttpClient(withInterceptors([noCacheInterceptor]))]
};
