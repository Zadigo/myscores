<template>
  <nuxt-layout>
    <nuxt-page />
  </nuxt-layout>
</template>

<script setup lang="ts">
useState<boolean>('settingsModal', () => false)
</script>
