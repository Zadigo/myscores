import type { Empty, Player } from '~/types'
import { TransitionPresets, type UseTransitionOptions } from '@vueuse/core'
import { faker } from '@faker-js/faker'

export const usePlayersComposable = createGlobalState(() => {
  // const players = ref<Player[]>([])
  const players = useSessionStorage<Player[]>('players', [])

  function createPlayer() {
    players.value.push({
      name: faker.person.firstName(),
      score: 0,
      color: 'one',
      increment: 1,
      resetValue: 0
    })
  }

  const _player = ref<Empty<Player>>()
  const [isEditionModalOpen, toggleEditionModal] = useToggle()

  function selectForEdition(player: Empty<Player>) {
    _player.value = player
    toggleEditionModal(true)
  }

  const sortDirection = ref<'asc' | 'desc'>('desc')
  const sortedPlayers = ref<Player[]>([])
  watchDebounced(players, () => {
    sortedPlayers.value = players.value.sort((a, b) => {
      if (sortDirection.value === 'asc') {
        return a.score - b.score
      } else {
        return b.score - a.score
      }
    })
  }, { debounce: 2000, immediate: true, deep: true })

  return {
    players,
    sortedPlayers,
    editedPlayer: _player,
    isEditionModalOpen,
    sortDirection,
    createPlayer,
    selectForEdition
  }
})

export const useGlobalStatisticsComposble = createGlobalState(() => {
  const { players } = usePlayersComposable()

  const display = ref<'total' | 'average' | 'min' | 'max'>('total')

  const _values = computed(() => players.value.map(player => player.score))
  const _totalScore = useSum(_values)
  const _averageScore = useAverage(_values)
  const _minScore = useMin(_values)
  const _maxScore = useMax(_values)

  const options: UseTransitionOptions<number> = {
    duration: 2000,
    easing: TransitionPresets.easeInCubic,
    delay: 900
  }

  const transitionTotalScore = useTransition(_totalScore, options)
  const transitionAverageScore = useTransition(_averageScore, options)
  const transitionMinScore = useTransition(_minScore, { ...options, delay: 1200 })
  const transitionMaxScore = useTransition(_maxScore, { ...options, delay: 1500 })

  const totalScore = computed(() => {
    return transitionTotalScore.value.toFixed(0)
  })

  const averageScore = computed(() => {
    return transitionAverageScore.value.toFixed(2)
  })

  const minScore = computed(() => {
    return transitionMinScore.value.toFixed(0)
  })

  const maxScore = computed(() => {
    return transitionMaxScore.value.toFixed(0)
  })

  return {
    display,
    totalScore,
    averageScore,
    minScore,
    maxScore
  }
})
