<script setup lang="ts">

import {  ref } from 'vue';
import { useRoute } from 'vue-router'
import { getPagePartsByPageNumber, getPageNumFromRoot, maxPage, saveData } from '/@/data/dictionaries';
import { computed } from '@vue/reactivity';

const currentPage = ref(1);
const route = useRoute();

currentPage.value = getPageNumFromRoot(route.params.root as string);

// const imageUrl = computed(() => `/books/lur/${currentPage.value}.jpg`);
const imageParts = computed(() => getPagePartsByPageNumber(currentPage.value));

const goForPage = (isNext: boolean) => {
  const diff = isNext ? 1 : -1;
  if (currentPage.value !== 0 && currentPage.value !== maxPage) {
    currentPage.value +=  diff;
  }
}

const sendData = (i: string) => {
  console.log('root', route.params.root, 'ayaIndex', route.query.ayaIndex, 'pageNo', currentPage.value, 'partNo', i);
  const ayaIndex = route.query.ayaIndex;
  if (!ayaIndex) {
    alert('Aya index not found')
    return;
  }

  if (confirm("Want to save?") == true) {
    saveData({
      root: route.params.root,
      ayaIndex,
      wordPath: i,
    });
  }
}

</script>
<template>
  <div class="container max-w-3xl mx-auto">
    Dictionary
    <!-- <img :src="imageUrl" /> -->
    <div v-for="i in imageParts" :key="i" class="word-box" @click="sendData(`${currentPage}_${i}.png`)">
      <img :src="`/books/lur/words/${currentPage}_${i}.png`" />    
    </div>

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
.word-box:hover {
  outline: 3px solid rgba(83, 23, 223, .8);
}
</style>
