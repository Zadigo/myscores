// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  modules: [
    '@nuxt/eslint',
    '@nuxt/ui',
    '@vueuse/nuxt',
    '@nuxt/a11y',
    '@nuxt/hints',
    '@nuxt/scripts',
    '@pinia/nuxt',
    '@nuxtjs/seo'
  ],

  devtools: {
    enabled: true
  },

  css: ['~/assets/css/main.css'],

  routeRules: {
    '/': { prerender: true }
  },

  compatibilityDate: '2025-01-15',

  eslint: {
    config: {
      stylistic: {
        commaDangle: 'never',
        braceStyle: '1tbs'
      }
    }
  },

  ui: {
    prefix: 'nuxt'
  },
  
  fonts: {
    families: [
      {
        name: 'Zalando Sans'
      },
      {
        name: 'JetBrains Mono'
      }
    ]
  },

  app: {
    pageTransition: { 
      name: 'fade', 
      mode: 'out-in'
    }
  }
})

