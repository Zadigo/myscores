<template>
  <div :class="`p-5 bg-player-variant-${color}-800 text-player-variant-${color}-50 h-30 w-30 text-3xl flex justify-center items-center cursor-pointer rounded-lg`" @click.passive="$emit('increment')">
    <icon :name="iconName" />
  </div>
</template>

<script setup lang="ts">
import type { ColorVariant } from '~/types'

defineProps<{
  color: ColorVariant
  iconName: string
}>()

defineEmits<{
  increment: []
}>()
</script>
