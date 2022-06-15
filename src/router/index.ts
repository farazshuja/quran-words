import { createRouter, createWebHistory } from 'vue-router';

const routes = [
  {
    path: '/',
    component: () => import('/@/pages/Index.vue'),
  },
  {
    name: 'dictionary',
    path: '/dictionary/:name?/:root?',
    component: () => import('/@/pages/Dictionary.vue'),
  },
];

export const Router = createRouter({
  scrollBehavior: () => ({ left: 0, top: 0 }),
  history: createWebHistory(),
  routes,
});
