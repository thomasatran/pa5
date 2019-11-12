  section .text
  extern error
  extern print
  extern heap_alloc
  global our_code_starts_here

p1:
  mov rax, [rsp + 16]
  mov [rsp + -24], rax
  mov rax, [rsp + 8]
  mov [rsp + -32], rax
  mov [rsp + -16], r15
  mov rax, 2
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -24]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -32]
  mov [r15 + 0], rax
  add r15, 8
  mov rax, [rsp + -16]
  ret
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

  mov rax, 11
  jo near error_handle_of
  mov [rsp + -16], rax
  mov rax, 13
  jo near error_handle_of
  mov [rsp + -24], rax
  mov rax, temp_after_call_3
  mov [rsp + -32], rax
  mov [rsp + -40], rsp
  sub rsp, 24
  call p1
temp_after_call_3:
  mov rsp, [rsp + -16]
  mov [rsp + -16], rax
  mov rax, [rsp + -16]
  pop rbx
ret

