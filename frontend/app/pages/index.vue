<template>
  <section id="players" class="my-10">
    {{ players }}
    <div class="space-y-2">
      <!-- Players -->
      <base-player v-for="(_, idx) in players" :key="idx" :index="idx" />
    </div>

    <!-- Update Player Modal -->
    <lazy-modals-update-player hydrate-on-visible />

    <!-- Add Score Modal -->
    <lazy-modals-add-score hydrate-on-visible />

    <!-- Updated Score Modal -->
    <lazy-nuxt-modal v-model:open="showUpdatedScoreModal" hydrate-on-visible>
      <template #body>
        <nuxt-input v-if="isDefined(updatedScore)" v-model="updatedScore" type="number" />
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

const { players } = usePlayersComposable()

/**
 * Score
 */

const { showUpdatedScoreModal, updatedScore } = usePlayerScoreUpdateComposable()
</script>
