  section .text
  extern error
  extern print
  extern heap_alloc
  global our_code_starts_here

abs_val1:
  mov rax, [rsp + 8]
  mov [rsp + -16], rax
  mov rax, [rsp + -16]
  sub rax, 1
  mov rax, [rsp + -16]
  mov rax, 1
  jo near error_handle_of
  mov [rsp + -24], rax
  mov rax, [rsp + -16]
  sub rax, [rsp + -24]
  jo near error_handle_of
  shr rax, 61
  and rax, 4
  add rax, 0x2
  mov [rsp + -16], rax
  shl rax, 1
  and rax, 0x6
  cmp rax, 0x6
  je near error_handle_bool
  mov rax, [rsp + -16]
  cmp rax, 0x6
  jne near temp_if_ne_1
  mov rax, -1
  jo near error_handle_of
  mov [rsp + -24], rax
  mov rax, [rsp + -24]
  sar rax, 1
  mov [rsp + -24], rax
  mov rax, [rsp + 8]
  mov [rsp + -32], DWORD rax
  sub [rsp + -32], DWORD 1
  mov rax, [rsp + -24]
  imul rax, [rsp + -32]
  add rax, 1
  jo near error_handle_of
  jmp near temp_Iend_if_2
temp_if_ne_1:
  mov rax, [rsp + 8]
temp_Iend_if_2:
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

  mov rax, -5
  jo near error_handle_of
  mov [rsp + -16], rax
  mov rax, temp_after_call_3
  mov [rsp + -24], rax
  mov [rsp + -32], rsp
  sub rsp, 16
  call abs_val1
temp_after_call_3:
  mov rsp, [rsp + -16]
  pop rbx
ret

