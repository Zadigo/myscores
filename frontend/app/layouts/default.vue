<template>
  <section id="site" class="max-w-5xl px-10 py-5 mx-auto">
    <!-- Navigation -->
    <nav class="rounded-full w-full h-auto bg-primary-500 dark:bg-primary-700 p-2">
      <div class="flex justify-between w-full items-center">
        <ul class="w-full inline-flex justify-start gap-5">
          <li class="px-5 py-2 rounded-2xl bg-primary-700 dark:bg-primary-900 min-w-20 flex justify-center items-center">
            <nuxt-link to="/" class="block">
              <icon name="lucide:list" />
            </nuxt-link>
          </li>
        </ul>

        <ul class="w-full inline-flex justify-start gap-2">
          <li>
            <nuxt-button @click="() => { createPlayer() }">
              <icon name="lucide:plus" />
            </nuxt-button>
          </li>
          <li>
            <nuxt-button>
              <icon name="lucide:clock-fading" />
            </nuxt-button>
          </li>
          <li>
            <nuxt-button @click="() => { toggleSettingsModal() }">
              <icon name="lucide:cog" />
            </nuxt-button>
          </li>
        </ul>
      </div>
    </nav>

    <div class="grid grid-cols-12 gap-2 my-5">
      <statistics-card :total-score="totalScore" class="col-span-4" />
      <statistics-card :total-score="averageScore" class="col-span-4" />
      <statistics-card :total-score="minScore" class="col-span-4" />
    </div>

    <main>
      <slot />
    </main>

    <!-- Settings -->
    <lazy-nuxt-modal v-model:open="showSettingsModal" hydrate-on-visible>
      <template #body>
        <div>
          <p class="font-bold">
            Aggrégation des scores
          </p>

          <div class="rounded-2xl bg-primary-100 dark:bg-primary-900">
            <div class="p-5 not-last:border-b border-primary-100">
              Afficher le score le plus élevé
            </div>

            <div class="p-5">
              Afficher le score le plus bas
            </div>

            <div class="p-5">
              Afficher le score total
            </div>
          </div>

          <p class="font-bold">
            Tri des incrémentations
          </p>
          <div class="rounded-2xl bg-primary-100 dark:bg-primary-900">
            <div class="p-5 not-last:border-b border-primary-100">
              <nuxt-switch label="Activer le tri" />
            </div>
          </div>
        </div>
      </template>
    </lazy-nuxt-modal>
  </section>
</template>

<script setup lang="ts">
const showSettingsModal = useState<boolean>('settingsModal')
const toggleSettingsModal = useToggle(showSettingsModal)

/**
 * Players
 */

const { createPlayer } = usePlayersComposable()

/**
 * Statistics
 */

const { totalScore, averageScore, minScore } = useGlobalStatisticsComposble()
</script>
