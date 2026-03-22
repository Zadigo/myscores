<template>
  <article v-if="isDefined(player)" class="px-10 py-5 rounded-2xl" :style="{ backgroundColor: `var(--color-player-variant-${player.color}-500)` }">
    <!-- Player -->
    <div id="player-info" :class="`bg-player-variant-${player.color}-500`" class="flex justify-center items-center gap-5 mb-5 p-5 rounded-lg">
      <h2 class="font-semibold text-center text-2xl">
        {{ player.name }}
      </h2>

      <nuxt-button color="primary" variant="subtle" size="xs" @click.passive="() => { selectForEdition(player) }">
        <icon name="lucide:pen" />
      </nuxt-button>
    </div>

    <!-- Score -->
    <div class="flex justify-center items-center">
      <base-player-increment :color="player.color" icon-name="lucide:minus" @increment="() => { playSound(() => action(player, player?.increment, false)) }" />

      <!-- Score Display -->
      <div class="p-5 h-30 rounded-lg text-primary-50 mx-1 w-60 text-center bg-primary-400/20 dark:bg-slate-800/20 hover:bg-primary-500/20 dark:hover:bg-slate-500/30 cursor-pointer transition-colors duration-300 flex justify-center items-center" @click.passive="() => { selectPlayerForUpdate(player) }">
        <h2 ref="scoreEl" class="font-bold text-6xl md:text-7xl">
          {{ player.score }}
        </h2>
      </div>

      <base-player-increment :color="player.color" icon-name="lucide:plus" @increment="() => { playSound(() => action(player, player?.increment, true)) }" />
    </div>
  </article>
</template>

<script setup lang="ts">
import type { Player } from '~/types'

const props = defineProps<{
  player: Player
}>()

/**
 * Players
 */

const { selectForEdition } = usePlayersComposable()

/**
 * Score
 */

const { action, selectPlayerForUpdate } = usePlayerScoreUpdateComposable()

/**
 * Sound
 */

const { playSound } = useSoundEffectComposable('/click.mp3')

/**
 * Other
 */

const scoreEl = useTemplateRef('scoreEl')

const keyframes = [
  { transform: 'scale(1)' },
  { transform: 'scale(1.2)' },
  { transform: 'scale(1)' }
]

const { play } = useAnimate(scoreEl, keyframes, {
  duration: 200,
  delay: 100
})

watch(() => props.player.score, () => {
  play()
})
</script>
