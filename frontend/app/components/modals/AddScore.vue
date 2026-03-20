<template>
  <nuxt-modal v-model:open="showScoreModal">
    <template #body>
      <div class="flex flex-wrap gap-2">
        <nuxt-button @click="() => { isPositive = false }">
          <icon name="lucide:minus" />
        </nuxt-button>

        <nuxt-button @click="() => { isPositive = true }">
          <icon name="lucide:plus" />
        </nuxt-button>

        <div v-for="increment in availableIncrements" :key="increment.value" class="p-5 bg-primary-400 dark:bg-slate-800 hover:bg-primary-500 dark:hover:bg-slate-700 cursor-pointer rounded-2xl transition-colors duration-300" @click="() => { playSound(() => incrementBy(updatedPlayer, increment.value)) }">
          <div class="font-bold text-4xl flex items-center gap-2">
            <icon v-if="isPositive" name="lucide:plus" />
            <icon v-else name="lucide:minus" />

            <h2>
              {{ increment.value }}
            </h2>
          </div>
        </div>
      </div>
    </template>
  </nuxt-modal>
</template>

<script setup lang="ts">
const { updatedPlayer, isPositive, availableIncrements, showScoreModal, incrementBy } = usePlayerScoreUpdateComposable()

/**
 * Sound
 */

const { playSound } = useSoundEffectComposable('/click.mp3')
</script>
