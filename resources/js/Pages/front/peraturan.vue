<template>
    <div class="container" style="height: 800px !important">
        <div class="row">
            <div class="col-xxl-6">
                <h1>Peraturan</h1>
                <li
                    v-for="(row, i) in rules"
                    :key="row.id"
                    class="d-flex align-items-center py-2"
                >
                    <span class="bullet bg-dark"></span>&nbsp;&nbsp;
                    {{ row.desc }}
                </li>
                No. Telpon Pengelola kost : 6281345555506
            </div>
            <div class="col-xxl-6">
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
    props: {
        rules: Object,
    },
    data() {
        return {
            tata: [
                "1. Memiliki KTP",
                "2. Bersedia mengunggah KTP sebagai persyaratan pendaftaran",
                "3. Mendaftar di halaman Sign In",
                "4. Validasi E-Mail",
                "5. Memilih Room",
                "6. Melakukan pembayaran dengan mengunggah bukti transfer",
                "7. Rek Tujuan No Rekening BRI : 788401004189538",
                "8. Untuk informasi selanjutnya palnig lama 1 (satu) hari untuk mendapatkan approval booking dari Admin",
                "9. Jika telah di approve maka akan mendapatkan notif melalui Email & Whatsapp",
            ],
        };
    },
    created() {},
    methods: {},
};
</script>
