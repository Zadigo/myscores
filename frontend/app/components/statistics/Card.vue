<template>
  <div class="col-span-2 p-5 rounded-2xl bg-success-700 text-primary-50">
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
