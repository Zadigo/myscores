<template>
  <nuxt-modal v-model:open="isEditionModalOpen">
    <template #body>
      <div v-if="isDefined(editedPlayer)">
        <lazy-nuxt-input v-model="editedPlayer.name" :hydrate-when="isEditionModalOpen" placeholder="Nom du joueur" />
        <lazy-nuxt-input v-model="editedPlayer.increment" type="number" min="0" :hydrate-when="isEditionModalOpen" placeholder="Incrémentation" />
        <lazy-nuxt-input v-model="editedPlayer.resetValue" type="number" min="0" :hydrate-when="isEditionModalOpen" placeholder="Valeur de réinitialisation" />
        {{ editedPlayer }}
        <div id="colors">
          <div class="flex flex-wrap mt-5">
            <div v-for="color in defaultColors" :id="`color-${color}`" :key="color" :class="{ 'border-4 border-white/50': editedPlayer.color === color }" class="w-10 h-10" :style="{ backgroundColor: `var(--color-player-variant-${color}-500)` }" @click="() => { select(editedPlayer, color) }" />
          </div>
        </div>
      </div>
    </template>

    <template #footer>
      <lazy-nuxt-button :hydrate-when="isEditionModalOpen" color="primary" @click="() => { isEditionModalOpen = false }">
        Enregistrer
      </lazy-nuxt-button>
    </template>
  </nuxt-modal>
</template>

<script setup lang="ts">
/**
 * Players
 */

const { isEditionModalOpen, editedPlayer } = usePlayersComposable()

/**
 * Colors
 */

const { defaultColors, select } = useColorsComposable()
</script>
