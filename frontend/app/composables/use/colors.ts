type ColorVariant = 'one' | 'two' | 'three' | 'four'

export const useColors = createGlobalState(() => {
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

  return {
    defaultColors,
    selectedColors,
    randomColor
  }
})
