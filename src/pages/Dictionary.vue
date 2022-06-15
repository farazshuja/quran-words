<script setup lang="ts">

import {  ref } from 'vue';
import { useRoute } from 'vue-router'
import { getPageNumFromRoot, maxPage } from '/@/data/dictionaries';
import { computed } from '@vue/reactivity';

const currentPage = ref(1);
const route = useRoute();

currentPage.value = getPageNumFromRoot(route.params.root as string);

const imageUrl = computed(() => `/books/lur/${currentPage.value}.jpg`);

const goForPage = (isNext: boolean) => {
  const diff = isNext ? 1 : -1;
  if (currentPage.value !== 0 && currentPage.value !== maxPage) {
    currentPage.value +=  diff;
  }
}

</script>
<template>
  <div class="container max-w-3xl mx-auto">
    Dictionary
    <img :src="imageUrl" />

    <!-- next/prev pages-->
    <a
      href="#"
      @click="goForPage(false)"
      class="fixed top-5 left-5 text-3xl text-cyan-700 hover:text-cyan-500"
      title="next"
    >
      <i i="ph-arrow-arc-left-bold" />
    </a>
    <a
      href="#"
      @click="goForPage(true)"
      class="fixed top-5 right-5 text-3xl text-cyan-700 hover:text-cyan-500"
      title="next"
    >
      <i i="ph-arrow-arc-right-bold" />
    </a>
  </div>
</template>

<style>
a,
.footer-link {
  @apply transition-all ease-out duration-100;
}

.footer-link {
  opacity: 0.8;
}
</style>
