import type { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'fr.cuisinepro.app',
  appName: 'Cuisine Pro',
  webDir: 'www',
  bundledWebRuntime: false,
  ios: { contentInset: 'automatic' },
  android: { allowMixedContent: false },
};

export default config;
