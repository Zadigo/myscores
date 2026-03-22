import type { ColorVariant, Empty, Player } from '~/types'

export const useColorsComposable = createGlobalState(() => {
  const defaultColors: ColorVariant[] = ['one', 'two', 'three', 'four']

  const selectedColors = ref<ColorVariant[]>([])

  function randomColor(): ColorVariant | undefined {
    const color = defaultColors[Math.floor(Math.random() * defaultColors.length)]
    if (selectedColors.value.includes(color)) {
      return randomColor()
    }
    selectedColors.value.push(color)
    return color
  }

  function select(player: Empty<Player>, color: ColorVariant) {
    selectedColors.value.push(color)
    if (isDefined(player)) {
      player.color = color
    }
    // if (!selectedColors.value.includes(color)) {
    // }
  }

  return {
    defaultColors,
    selectedColors,
    randomColor,
    select
  }
})
