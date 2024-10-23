<script setup lang="ts">
const items = [
  { title: "Click Me" },
  { title: "Click Me" },
  { title: "Click Me" },
  { title: "Click Me 2" },
];
</script>

<template>
  <main class="main">
    <h1 class="">HOME</h1>
    <v-btn prepend-icon="$vuetify"> Button </v-btn>
    <v-list lines="one">
      <v-list-item
        v-for="n in 3"
        :key="n"
        :title="'Item ' + n"
        subtitle="Lorem ipsum dolor sit amet consectetur adipisicing elit"
      ></v-list-item>
    </v-list>

    <template>
      <div class="d-flex justify-space-around">
        <v-menu>
          <template v-slot:activator="{ props }">
            <v-btn color="primary" v-bind="props"> Activator slot </v-btn>
          </template>
          <v-list>
            <v-list-item
              v-for="(item, index) in items"
              :key="index"
              :value="index"
            >
              <v-list-item-title>{{ item.title }}</v-list-item-title>
            </v-list-item>
          </v-list>
        </v-menu>

        <v-btn color="primary">
          Parent activator

          <v-menu activator="parent">
            <v-list>
              <v-list-item
                v-for="(item, index) in items"
                :key="index"
                :value="index"
              >
                <v-list-item-title>{{ item.title }}</v-list-item-title>
              </v-list-item>
            </v-list>
          </v-menu>
        </v-btn>

        <v-btn id="menu-activator" color="primary"> Sibling activator </v-btn>

        <v-menu activator="#menu-activator">
          <v-list>
            <v-list-item
              v-for="(item, index) in items"
              :key="index"
              :value="index"
            >
              <v-list-item-title>{{ item.title }}</v-list-item-title>
            </v-list-item>
          </v-list>
        </v-menu>
      </div>
    </template>
  </main>
</template>

<style>
.main {
  padding-top: 3rem;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  gap: 3rem;
}
</style>
