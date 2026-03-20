import type { Empty, Player, ScoreIncrement, Undefineable } from '~/types'

export const usePlayerScoreUpdateComposable = createGlobalState(() => {
  const _player = ref<Empty<Player>>()

  const [showScoreModal, toggleScoreModal] = useToggle()

  function selectPlayerForUpdate(player: Empty<Player>) {
    if (isDefined(player)) {
      _player.value = player
      toggleScoreModal()
    }
  }

  const updatedScore = ref<Undefineable<ScoreIncrement>>()
  const [showUpdatedScoreModal, toggleUpdatedScoreModal] = useToggle()

  const availableIncrements = ref<ScoreIncrement[]>([
    {
      value: 5
    },
    {
      value: 10
    },
    {
      value: 15
    },
    {
      value: 20
    },
    {
      value: 50
    },
    {
      value: 100
    },
    {
      value: 200
    }
  ])

  const isPositive = ref(true)
  function incrementBy(player: Empty<Player>, score: number) {
    if (isPositive.value) {
      action(player, score, true)
    } else {
      action(player, score, false)
    }
    toggleScoreModal()
  }

  function action(player: Empty<Player>, score: Undefineable<number>, isAddition: boolean) {
    const _score = score || 1
    _player.value = player

    if (isDefined(_player)) {
      if (isAddition) {
        _player.value.score += _score
      } else {
        _player.value.score -= _score
      }
    }
  }

  return {
    updatedPlayer: _player,
    updatedScore,
    isPositive,
    availableIncrements,
    showScoreModal,
    showUpdatedScoreModal,
    toggleUpdatedScoreModal,
    action,
    selectPlayerForUpdate,
    incrementBy
  }
})
