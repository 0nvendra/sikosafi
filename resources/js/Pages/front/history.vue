<template>
    <div class="mb-n10 mb-lg-n20 z-index-2">
        <div class="container">
            <h1>History</h1>
        </div>
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
    props: {},
    data() {
        return {
            search: "",
            edit: false,
            formLoading: false,
        };
    },
    created() {},
    methods: {},
};
</script>
