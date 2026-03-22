import type { Player } from '~/types'

type PlayerRanking = {
  playerName: string
  score: number
}

type Ranking = {
  gameName: string
  ranking: PlayerRanking[]
}

export const useRankingComposable = createGlobalState(() => {
  const gameName = ref<string>('')
  const ranking = ref<Ranking[]>([])
  const [showCreateRanking, toggleShowCreateRanking] = useToggle(false)

  const selectedRankingIndex = ref<number>(0)
  const selectedRanking = computed(() => ranking.value[selectedRankingIndex.value])
  const selectedRankingTableRows = computed(() => {
    if (!selectedRanking.value) return []

    return selectedRanking.value.ranking.map((playerRanking, idx) => ({
      rank: idx + 1,
      name: playerRanking.playerName,
      score: playerRanking.score
    }))
  })

  const gameNames = computed(() => ranking.value.map(r => r.gameName))

  function create(players: Player[]) {
    const existingGame = useArrayFind(ranking.value, r => r.gameName === gameName.value)

    if (isDefined(existingGame)) {
      existingGame.value.ranking = players.map(player => ({
        playerName: player.name,
        score: player.score
      }))
    } else {
      const newRanking: Ranking = {
        gameName: gameName.value,
        ranking: players.map(player => ({
          playerName: player.name,
          score: player.score
        }))
      }

      ranking.value.push(newRanking)
    }

    toggleShowCreateRanking()
    gameName.value = ''
  }

  return {
    ranking,
    showCreateRanking,
    gameName,
    selectedRanking,
    selectedRankingTableRows,
    gameNames,
    create,
    toggleShowCreateRanking
  }
})
