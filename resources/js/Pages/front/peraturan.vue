<template>
    <div class="container" style="height:800px!important">
        <h1>Peraturan</h1>
        <li
            v-for="(row, i) in rules"
            :key="row.id"
            class="d-flex align-items-center py-2"
        >
            <span class="bullet bg-dark"></span>&nbsp;&nbsp;
            {{ row.desc }}
        </li>
    </div>
</template>
<script>
import LayoutApp from "@/Layouts/Front.vue";
import { Head, Link } from "@inertiajs/inertia-vue3";
export default {
    layout: LayoutApp,
    components: {
        Head,
        Link,
    },
    props: {
        rules: Object,
    },
    data() {
        return {};
    },
    created() {},
    methods: {},
};
</script>
