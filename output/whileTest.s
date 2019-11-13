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

  mov rax, 21
  jo near error_handle_of
  mov [rsp + -16], rax
  mov rax, 1
  jo near error_handle_of
  mov [rsp + -24], rax
temp_while_cond_1:
  mov rax, [rsp + -24]
  mov [rsp + -32], rax
  and rax, 1
  shl rax, 2
  add rax, 2
  cmp rax, 0x6
  jne near error_handle_num
  mov rax, [rsp + -32]
  and rax, 0xfffffffffffffffe
  mov rax, [rsp + -32]
  mov rax, [rsp + -16]
  mov [rsp + -40], rax
  and rax, 1
  shl rax, 2
  add rax, 2
  cmp rax, 0x6
  jne near error_handle_num
  mov rax, [rsp + -32]
  sub rax, [rsp + -40]
  jo near error_handle_of
  shr rax, 61
  and rax, 4
  add rax, 0x2
  cmp rax, 0x6
  jne near temp_end_while_2
  mov rax, [rsp + -24]
  mov [rsp + -32], rax
  and rax, 1
  shl rax, 2
  add rax, 2
  cmp rax, 0x6
  jne near error_handle_num
  mov rax, [rsp + -32]
  xor rax, 1
  mov [rsp + -32], rax
  mov rax, 3
  jo near error_handle_of
  mov [rsp + -40], rax
  and rax, 1
  shl rax, 2
  add rax, 2
  cmp rax, 0x6
  jne near error_handle_num
  mov rax, [rsp + -32]
  add rax, [rsp + -40]
  jo near error_handle_of
  mov [rsp + -24], rax
  jmp near temp_while_cond_1
temp_end_while_2:
  mov rax, [rsp + -24]
  pop rbx
ret

