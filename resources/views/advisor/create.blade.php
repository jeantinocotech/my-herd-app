@extends('layouts.app')

@section('content')
<div class="profile-form-container">
    <form action="{{ route('advisor-profile.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <h2>Advisor Profile</h2>

        <!-- Profile Picture -->
        <label for="profile-photo">Profile Picture</label>
        <input type="file" id="profile-photo" name="profile_photo">

        <!-- Name -->
        <label for="name">Full Name</label>
        <input type="text" name="full_name" value="{{ old('full_name') }}" class="form-control" placeholder="Enter your full name" required>


        <!-- Email -->
        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" required>

        <!-- Areas of Expertise -->
        <label for="expertise">Areas of Expertise</label>
        <textarea id="expertise" name="expertise" placeholder="E.g., Technology, Finance"></textarea>

        <!-- Dynamic Education Fields -->
        <label for="education-entries">Education</label>
        <div id="education-entries">
            <div class="education-entry">
                <input type="text" name="education[]" placeholder="E.g., Bachelor's in Computer Science">
                <button type="button" class="remove-entry">Remove</button>
            </div>
        </div>
        <button type="button" id="add-education" class="btn btn-secondary">Add Education</button>

        <label for="course">Courses</label>
        <select name="course[]" id="course" class="form-control">
            <option value="">-- Select a Course --</option>
            @foreach ($courses as $course)
                <option value="{{ $course->id }}">{{ $course->courses_name }}</option>
            @endforeach
        </select>

        <!-- Submit Button -->
        <button type="submit" class="btn">Save Profile</button>
    </form>
</div>

<script>
    document.getElementById('add-education').addEventListener('click', function () {
        const container = document.getElementById('education-entries');
        const newEntry = document.createElement('div');
        newEntry.classList.add('education-entry');
        newEntry.innerHTML = `
            <input type="text" name="education[]" placeholder="E.g., Bachelor's in Computer Science">
            <button type="button" class="remove-entry">Remove</button>
        `;
        container.appendChild(newEntry);
    });

    document.addEventListener('click', function (event) {
        if (event.target.classList.contains('remove-entry')) {
            event.target.parentElement.remove();
        }
    });
</script>
@endsection
