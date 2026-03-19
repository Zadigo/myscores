<template>
  <nuxt-modal v-model:open="isModalOpen" hydrate-on-visible>
    <template #body>
      <div v-if="isDefined(editedPlayer)">
        <nuxt-input v-model="editedPlayer.name" placeholder="Nom du joueur" />
        <nuxt-input v-model="editedPlayer.increment" type="number" min="0" placeholder="Incrémentation" />
        <nuxt-input v-model="editedPlayer.resetValue" type="number" min="0" placeholder="Valeur de réinitialisation" />
      </div>
    </template>

    <template #footer>
      <nuxt-button color="primary" @click="() => { isModalOpen = false }">
        Enregistrer
      </nuxt-button>
    </template>
  </nuxt-modal>
</template>

<script setup lang="ts">
/**
 * Players
 */

const { isModalOpen, editedPlayer } = usePlayersComposable()
</script>
