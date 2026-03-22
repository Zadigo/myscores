<template>
  <nav class="rounded-2xl w-full h-auto bg-primary-600/80 backdrop-blur-3xl dark:bg-primary-700 p-2 shadow-2xl">
    <div class="flex justify-between w-full items-center">
      <ul class="w-full inline-flex justify-start gap-2 text-primary-50">
        <li v-for="link in links" :key="link.name" class="px-5 py-2 rounded-2xl bg-primary-700 dark:bg-primary-800 has-[.router-link-exact-active]:bg-primary-900 min-w-20 flex justify-center items-center">
          <nuxt-link :to="link.href" class="block">
            <icon :name="link.icon" />
          </nuxt-link>
        </li>
      </ul>

      <ul class="w-full inline-flex justify-start gap-2">
        <li>
          <nuxt-button @click="() => { createPlayer() }">
            <icon name="lucide:plus" />
          </nuxt-button>
        </li>
        <li>
          <nuxt-button @click="() => { toggleShowCreateRanking() }">
            <icon name="lucide:save" />
          </nuxt-button>
        </li>
        <li>
          <nuxt-button>
            <icon name="lucide:clock-fading" />
          </nuxt-button>
        </li>
        <li>
          <nuxt-button @click="() => { toggleSettingsModal() }">
            <icon name="lucide:cog" />
          </nuxt-button>
        </li>
      </ul>
    </div>
  </nav>
</template>

<script setup lang="ts">
const showSettingsModal = useState<boolean>('settingsModal')
const toggleSettingsModal = useToggle(showSettingsModal)

/**
 * Players
 */

const { createPlayer } = usePlayersComposable()

/**
 * Ranking
 */

const { toggleShowCreateRanking } = useRankingComposable()

/**
 * Links
 */

const links = [
  {
    name: 'Home',
    icon: 'lucide:list-ordered',
    href: '/'
  },
  {
    name: 'Ranking',
    icon: 'lucide:arrow-up-1-0',
    href: '/ranking'
  }
]
</script>
