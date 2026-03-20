export function useSoundEffectComposable(path: string) {
  const { play } = useSound(path, {
    volume: 0.5
  })

  function playSound<T extends (...args: unknown[]) => void>(callback: T) {
    play()
    callback()
  }

  return {
    playSound
  }
}
