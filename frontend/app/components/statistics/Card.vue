<template>
  <div class="col-span-2 p-5 rounded-2xl bg-statistic-500/30 backdrop-blur-2xl shadow-2xl text-statistic-50">
    <h2 class="flex justify-center items-center">
      <icon name="lucide:sigma" class="text-2xl font-semibold" />
      <span class="text-3xl md:text-5xl font-bold">
        {{ totalScore }}
      </span>
    </h2>
  </div>
</template>

<script setup lang="ts">
defineProps<{
  totalScore: string
}>()
</script>
