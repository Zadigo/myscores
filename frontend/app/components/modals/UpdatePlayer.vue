<template>
  <nuxt-modal v-model:open="isEditionModalOpen">
    <template #body>
      <div v-if="isDefined(editedPlayer)">
        <lazy-nuxt-input v-model="editedPlayer.name" :hydrate-when="isEditionModalOpen" placeholder="Nom du joueur" />
        <lazy-nuxt-input v-model="editedPlayer.increment" type="number" min="0" :hydrate-when="isEditionModalOpen" placeholder="Incrémentation" />
        <lazy-nuxt-input v-model="editedPlayer.resetValue" type="number" min="0" :hydrate-when="isEditionModalOpen" placeholder="Valeur de réinitialisation" />
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
</script>
