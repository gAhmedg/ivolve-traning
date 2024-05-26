---
- name: Send email using Ansible
  hosts: localhost
  tasks:
    - name: Send email
      mail:
        host: smtp.gmail.com
        port: 587
        username: gahmedg906@gmail.com 
        password: 601262as
    
        to: gomaaa447@gmail.com
        subject: Test Email Subject
        body: This is a test email sent from Ansible.
        secure: starttls
