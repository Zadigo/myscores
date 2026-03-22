<template>
  <section id="site" class="max-w-5xl px-10 py-5 mx-auto">
    <!-- Navigation -->
    <base-navbar />

    <main>
      <slot />
    </main>

    <!-- Create Ranking -->
    <lazy-nuxt-modal v-model:open="showCreateRanking" hydrate-on-visible>
      <template #body>
        <nuxt-form-field label="Name" required>
          <nuxt-input v-model.trim="gameName" />
        </nuxt-form-field>
      </template>

      <template #footer>
        <nuxt-button @click="() => { create(players) }">
          Créer
        </nuxt-button>
      </template>
    </lazy-nuxt-modal>

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

/**
 * Background
 */

onMounted(() => {
  document.body.classList.add('bg-primary-500', 'dark:bg-primary-900')
})

/**
 * Ranking
 */

const { players } = usePlayersComposable()
const { create, gameName, showCreateRanking } = useRankingComposable()
</script>
