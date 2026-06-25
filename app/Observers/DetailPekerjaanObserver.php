<?php

namespace App\Observers;

use App\Models\DetailPekerjaan;

class DetailPekerjaanObserver
{
    private function recalculateTotalDurasi(DetailPekerjaan $detailPekerjaan)
    {
        if ($detailPekerjaan->masterPekerjaan) {
            $totalDurasi = $detailPekerjaan->masterPekerjaan->detailPekerjaans()->sum('durasi_hari');
            $detailPekerjaan->masterPekerjaan->update([
                'total_durasi_hari' => $totalDurasi
            ]);
        }
    }

    /**
     * Handle the DetailPekerjaan "created" event.
     */
    public function created(DetailPekerjaan $detailPekerjaan): void
    {
        $this->recalculateTotalDurasi($detailPekerjaan);
    }

    /**
     * Handle the DetailPekerjaan "updated" event.
     */
    public function updated(DetailPekerjaan $detailPekerjaan): void
    {
        $this->recalculateTotalDurasi($detailPekerjaan);
    }

    /**
     * Handle the DetailPekerjaan "deleted" event.
     */
    public function deleted(DetailPekerjaan $detailPekerjaan): void
    {
        $this->recalculateTotalDurasi($detailPekerjaan);
    }

    /**
     * Handle the DetailPekerjaan "restored" event.
     */
    public function restored(DetailPekerjaan $detailPekerjaan): void
    {
        $this->recalculateTotalDurasi($detailPekerjaan);
    }

    /**
     * Handle the DetailPekerjaan "force deleted" event.
     */
    public function forceDeleted(DetailPekerjaan $detailPekerjaan): void
    {
        $this->recalculateTotalDurasi($detailPekerjaan);
    }
}
