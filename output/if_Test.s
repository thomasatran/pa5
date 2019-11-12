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

  mov rax, 0x6
  mov rax, 0x6
  mov [rsp + -16], rax
  shl rax, 1
  and rax, 0x6
  cmp rax, 0x6
  je near error_handle_bool
  mov rax, [rsp + -16]
  cmp rax, 0x6
  jne near temp_if_ne_1
  mov rax, 11
  jo near error_handle_of
  jmp near temp_Iend_if_2
temp_if_ne_1:
  mov rax, 13
  jo near error_handle_of
temp_Iend_if_2:
  pop rbx
ret

