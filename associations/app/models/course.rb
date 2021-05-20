class Course < ApplicationRecord

    has_many :enrollments,
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Enrollment

    has_many :enrolled_students,
        primary_key: :id,
        foreign_key: :student_id,
        class_name: :Enrollment

    has_many :instructor,
        # primary_key: :id,
        # foreign_key: :instructor_id,
        # class_name: :User
        through: :enrollments,
        source: :user
end
