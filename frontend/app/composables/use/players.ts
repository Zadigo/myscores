import type { Empty, Nullable, Player } from '~/types'
import { faker } from '@faker-js/faker'

export const usePlayersComposable = createGlobalState(() => {
  const players = ref<Player[]>([])

  function createPlayer() {
    players.value.push({
      name: faker.person.firstName(),
      score: 0,
      color: null,
      increment: 1,
      resetValue: 0
    })
  }

  const editedPlayer = ref<Nullable<Player>>(null)
  const [isModalOpen, toggleModal] = useToggle()

  function editPlayer(player: Empty<Player>) {
    if (isDefined(player)) {
      editedPlayer.value = player
      toggleModal()
    }
  }

  function _getPlayer(index: number) {
    return players.value[index]
  }

  const getPlayer = reactify(_getPlayer)

  return {
    players,
    editedPlayer,
    isModalOpen,
    getPlayer,
    createPlayer,
    editPlayer
  }
})
