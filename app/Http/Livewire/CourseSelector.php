<?php

namespace App\Http\Livewire;

use Livewire\Component;
use App\Models\Course;
use Illuminate\Support\Collection;

class CourseSelector extends Component
{
    public $search = '';
    public $selectedCourses = [];
    public $availableCourses = [];
    public $showDropdown = false;
    
    // If editing a profile, initialize with existing selections
    public function mount($selectedCourseIds = [])
    {
        if (!empty($selectedCourseIds)) {
            $this->selectedCourses = Course::whereIn('id', $selectedCourseIds)
                ->select('id', 'courses_name')
                ->get()
                ->toArray();
        }
        
        $this->loadAvailableCourses();
    }

    public function loadAvailableCourses()
    {
        $query = Course::query();
        
        if (!empty($this->search)) {
            $query->where('courses_name', 'like', '%' . $this->search . '%');
        }
        
        $this->availableCourses = $query->select('id', 'courses_name')
            ->orderBy('courses_name')
            ->take(50)
            ->get()
            ->toArray();
    }

    public function updatedSearch()
    {
        $this->loadAvailableCourses();
        $this->showDropdown = true;
    }

    public function selectCourse($courseId, $courseName)
    {
        if (!collect($this->selectedCourses)->contains('id', $courseId)) {
            $this->selectedCourses[] = [
                'id' => $courseId,
                'courses_name' => $courseName
            ];
        }
        $this->showDropdown = false;
        $this->search = '';
    }

    public function removeCourse($courseId)
    {
        $this->selectedCourses = collect($this->selectedCourses)
            ->reject(function ($course) use ($courseId) {
                return $course['id'] == $courseId;
            })->toArray();
    }

    public function render()
    {
        return view('livewire.course-selector');
    }
}