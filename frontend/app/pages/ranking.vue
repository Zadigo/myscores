<template>
  <section id="ranking" class="my-20">
    <div class="flex gap-1 mb-5">
      <nuxt-button v-for="(gameName, idx) in gameNames" :key="idx " @click="() => { select(idx) }">
        {{ gameName }}
      </nuxt-button>
    </div>

    <nuxt-table :data="selectedRankingTableRows" />
  </section>
</template>

<script setup lang="ts">
const { gameNames, selectedRankingTableRows, select } = useRankingComposable()
</script>
