<template>
    <div class="container" style="height:800px!important">
        <h1>Tata Cara Sewa</h1>
        <li
            v-for="(row, i) in tata"
            :key="row.id"
            class="d-flex align-items-center py-2"
        >
            <span class="bullet bg-dark"></span>&nbsp;
            {{ row }}
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
    },
    data() {
        return {
            tata:[
                '1. Memiliki KTP',
                '2. Bersedia mengunggah KTP sebagai persyaratan pendaftaran',
                '3. Mendaftar di halaman Sign In',
                '4. Validasi E-Mail',
                '5. Memilih Room',
                '6. Melakukan pembayaran dengan mengunggah bukti transfer pada No Rekening BRI : 788401004189538',
            ]
        };
    },
    created() {},
    methods: {},
};
</script>
