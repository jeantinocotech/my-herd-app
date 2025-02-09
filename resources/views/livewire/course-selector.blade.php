<div class="relative" x-data="{ open: false }" @click.away="open = false">
    {{-- Selected Courses Tags --}}
    <div class="mb-2 flex flex-wrap gap-2">
        @foreach($selectedCourses as $course)
            <span class="inline-flex items-center px-2 py-1 rounded-md bg-indigo-100 text-indigo-800 text-sm">
                {{ $course['courses_name'] }}
                <button type="button" wire:click="removeCourse({{ $course['id'] }})" class="ml-1 text-indigo-600 hover:text-indigo-800">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                    </svg>
                </button>
            </span>
        @endforeach
    </div>

    {{-- Search Input --}}
    <div class="relative">
        <input
            type="text"
            wire:model.live.debounce.300ms="search"
            @focus="open = true"
            class="w-full px-4 py-2 border rounded-md pr-10 focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500"
            placeholder="Search courses..."
        >
        <div class="absolute inset-y-0 right-0 flex items-center pr-3">
            <svg class="h-5 w-5 text-gray-400" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"/>
            </svg>
        </div>
    </div>

    {{-- Dropdown List --}}
    @if($showDropdown && !empty($availableCourses))
        <div class="absolute z-10 w-full mt-1 bg-white rounded-md shadow-lg border max-h-60 overflow-auto">
            @forelse($availableCourses as $course)
                <button
                    type="button"
                    wire:click="selectCourse({{ $course['id'] }}, '{{ $course['courses_name'] }}')"
                    class="w-full px-4 py-2 text-left hover:bg-gray-100 {{ collect($selectedCourses)->contains('id', $course['id']) ? 'bg-indigo-50' : '' }}"
                >
                    {{ $course['courses_name'] }}
                </button>
            @empty
                <div class="px-4 py-2 text-gray-500">No courses found</div>
            @endforelse
        </div>
    @endif

    {{-- Hidden inputs for form submission --}}
    @foreach($selectedCourses as $course)
        <input type="hidden" name="interest_areas[]" value="{{ $course['id'] }}">
    @endforeach
</div>