  section .text
  extern error
  extern print
  extern heap_alloc
  global our_code_starts_here

error_handle_num:
  mov rdi, 0
  push 0
  call error
error_handle_bool:
  mov rdi, 1
  push 0
  call error
error_handle_of:
  mov rdi, 2
  push 0
  call error
out_of_bounds:
  mov rdi, 3
  push 0
  call error
our_code_starts_here:
push rbx
  mov r15, rdi
  mov [rsp - 8], rsi

  mov rax, 0
  cmp rax, 0
  jne near temp_fif_ne_5
  mov rax, 0x6
  jmp near temp_fend_if_4
temp_fif_ne_5:
  mov rax, 0x2
temp_fend_if_4:
  pop rbx
ret

