<template>
  <section id="ranking" class="my-20">
    <nuxt-button v-for="(gameName, idx) in gameNames" :key="idx">
      {{ gameName }}
    </nuxt-button>

    <nuxt-table :data="selectedRankingTableRows" />
  </section>
</template>

<script setup lang="ts">
const { gameNames, selectedRankingTableRows } = useRankingComposable()
</script>
