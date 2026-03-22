<template>
  <section id="players" class="my-10">
    <div class="grid grid-cols-12 gap-2 my-5">
      <statistics-card :total-score="totalScore" class="col-span-4" />
      <statistics-card :total-score="averageScore" class="col-span-4" />
      <statistics-card :total-score="minScore" class="col-span-4" />
    </div>

    <!-- Players -->
    <div class="space-y-2">
      <transition-group enter-active-class="transition-all ease-in-out duration-300" enter-from-class="opacity-0 scale-95" enter-to-class="opacity-100 scale-100" leave-from-class="opacity-100 scale-100" leave-to-class="opacity-0 scale-95">
        <lazy-base-player v-for="(player, idx) in sortedPlayers" :key="idx" :player="player" hydrate-on-idle />
      </transition-group>
    </div>

    <!-- Update Player Modal -->
    <lazy-modals-update-player hydrate-on-idle />

    <!-- Add Score Modal -->
    <lazy-modals-add-score hydrate-on-idle />

    <!-- Updated Score Modal -->
    <lazy-nuxt-modal v-model:open="showUpdatedScoreModal" hydrate-on-idle>
      <template #body>
        <div v-if="isDefined(updatedScore)">
          <nuxt-input v-model="updatedScore" type="number" />
        </div>
      </template>
    </lazy-nuxt-modal>
  </section>
</template>

<script setup lang="ts">
definePageMeta({
  layout: 'default'
})

/**
 * Players
 */

const { sortedPlayers } = usePlayersComposable()

/**
 * Score
 */

const { showUpdatedScoreModal, updatedScore } = usePlayerScoreUpdateComposable()

/**
 * Statistics
 */

const { totalScore, averageScore, minScore } = useGlobalStatisticsComposble()
</script>
