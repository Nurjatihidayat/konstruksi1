<x-app-layout>
<x-slot name="header">
<h2 class="font-black text-2xl text-gray-800 leading-tight tracking-tighter uppercase">
{{ __('📋 Tambah Pekerjaan') }}
</h2>
</x-slot>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="py-12">
    <div class="max-w-3xl mx-auto sm:px-6 lg:px-8">
        <div class="card shadow-sm border-0 rounded-4">
            <div class="card-body p-5">
                <h4 class="card-title fw-bold text-primary text-uppercase mb-4">Form Tambah Pekerjaan</h4>

                <form action="{{ route('pekerjaans.store') }}" method="POST">
                    @csrf

                    <div class="row g-4 mb-4">
                        <!-- Project -->
                        <div class="col-md-6">
                            <label for="project_id" class="form-label fw-bold text-uppercase small text-muted">Project</label>
                            <select name="project_id" id="project_id" class="form-select @error('project_id') is-invalid @enderror" required>
                                <option value="">-- Pilih Project --</option>
                                @foreach($projects as $project)
                                    <option value="{{ $project->id }}" {{ old('project_id') == $project->id ? 'selected' : '' }}>
                                        {{ $project->nama_proyek }}
                                    </option>
                                @endforeach
                            </select>
                            @error('project_id')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <!-- Master Pekerjaan -->
                        <div class="col-md-12">
                            <label for="master_pekerjaan_id" class="form-label fw-bold text-uppercase small text-muted">Master Pekerjaan</label>
                            <select name="master_pekerjaan_id" id="master_pekerjaan_id" class="form-select @error('master_pekerjaan_id') is-invalid @enderror" required>
                                <option value="">-- Pilih Master Pekerjaan --</option>
                                @foreach($masterPekerjaans as $master)
                                    <option value="{{ $master->id }}" {{ old('master_pekerjaan_id') == $master->id ? 'selected' : '' }}>
                                        {{ $master->kode_pekerjaan }} - {{ $master->nama_pekerjaan }} ({{ $master->total_durasi_hari }} Hari)
                                    </option>
                                @endforeach
                            </select>
                            @error('master_pekerjaan_id')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <!-- Tanggal Mulai -->
                        <div class="col-md-6">
                            <label for="tanggal_mulai" class="form-label fw-bold text-uppercase small text-muted">Tanggal Mulai</label>
                            <input type="date" class="form-control @error('tanggal_mulai') is-invalid @enderror" 
                                   id="tanggal_mulai" name="tanggal_mulai" value="{{ old('tanggal_mulai') }}" required>
                            @error('tanggal_mulai')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <!-- Tanggal Selesai -->
                        <div class="col-md-6">
                            <label for="tanggal_selesai" class="form-label fw-bold text-uppercase small text-muted">Tanggal Selesai</label>
                            <input type="date" class="form-control @error('tanggal_selesai') is-invalid @enderror" 
                                   id="tanggal_selesai" name="tanggal_selesai" value="{{ old('tanggal_selesai') }}" required>
                            @error('tanggal_selesai')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        <!-- Catatan -->
                        <div class="col-md-12">
                            <label for="catatan" class="form-label fw-bold text-uppercase small text-muted">Catatan (Opsional)</label>
                            <textarea class="form-control @error('catatan') is-invalid @enderror" 
                                      id="catatan" name="catatan" rows="3" 
                                      placeholder="Catatan tambahan...">{{ old('catatan') }}</textarea>
                            @error('catatan')
                                <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>

                    <div class="alert alert-info">
                        <strong>Info:</strong> Detail Pekerjaan dan Detail Material akan mengikuti dari Master Pekerjaan yang dipilih dan tidak dapat diubah.
                    </div>

                    <div class="d-flex justify-content-end gap-3 border-top pt-4">
                        <a href="{{ route('pekerjaans.index') }}" class="btn btn-light fw-bold text-uppercase px-4">Batal</a>
                        <button type="submit" class="btn btn-primary fw-bold text-uppercase px-4">
                            SIMPAN 📋
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</x-app-layout>