module mod_alloc
    implicit none
    
    private

    public :: alloc, free
contains
    
    subroutine alloc(array, alloc_size)
        real, allocatable, intent(inout) :: array(:)
        integer, intent(in) :: alloc_size
        integer :: stat
        character(len=100) :: errmsg

        if (allocated(array)) call free(array)
    
        allocate(array(alloc_size), stat=stat, errmsg=errmsg)

        if (stat > 0) error stop errmsg

    end subroutine alloc

    subroutine free(array)
        real, allocatable, intent(inout) :: array(:)
        integer :: stat
        character(len=100) :: errmsg

        if (.not. allocated(array)) return
 
        deallocate(array, stat=stat, errmsg=errmsg)
        if (stat > 0) error stop errmsg
    
    end subroutine free
end module mod_alloc