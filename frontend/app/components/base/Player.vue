<template>
  <article v-if="isDefined(player)" class="px-10 py-5 rounded-2xl bg-info-400 dark:bg-info-900">
    <!-- Player -->
    <div id="player-info" class="flex justify-center items-center gap-5 mb-5">
      <h2 class="font-semibold text-center text-2xl">
        {{ player.name }}
      </h2>

      <nuxt-button color="info" variant="subtle" size="xs" @click.passive="() => { editPlayer(player) }">
        <icon name="lucide:pen" />
      </nuxt-button>
    </div>

    <!-- Score -->
    <div class="flex justify-center items-center">
      <div class="p-5 bg-info-500 h-30 w-30 text-3xl flex justify-center items-center cursor-pointer" @click.passive="() => { action(player, player?.increment, false) }">
        <icon name="lucide:minus" />
      </div>

      <!-- Score Display -->
      <div class="p-5 h-30 w-60 text-center bg-info-400 hover:bg-info-500 cursor-pointer transition-colors duration-300" @click.passive="() => { selectPlayerForUpdate(player) }">
        <h2 class="font-bold text-7xl">
          {{ player.score }}
        </h2>
      </div>

      <div class="p-5 bg-info-500 h-30 w-30 text-3xl flex justify-center items-center cursor-pointer" @click.passive="() => { action(player, player?.increment, true) }">
        <icon name="lucide:plus" />
      </div>
    </div>
  </article>
</template>

<script setup lang="ts">
const props = defineProps<{
  index: number
}>()

/**
 * Players
 */

const { getPlayer, editPlayer } = usePlayersComposable()

const player = getPlayer(props.index)

/**
 * Score
 */

const { action, selectPlayerForUpdate } = usePlayerScoreUpdateComposable()
</script>
