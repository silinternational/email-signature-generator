<script>
import Textfield from '@smui/textfield'

let name = 'Billy Clark'
let role = 'GTIS Application Developer'
let number = '704-491-6396'
let email = 'billy_clark@sil.org'
</script>

<style>
:global(body) {
  margin: 3rem;
}
/* Textfield tweak to ensure user input is not cut off if it's longer than the input's initial width */
:global(label) {
  width: 100%
}

.p {
  padding: 2rem;
}
.row {
  display: flex;
  flex-direction: row;
  align-items: center;
}
.grow {
  flex-grow: 1;
}
.mr {
  margin-right: 2rem;
}
.w {
  width: 50ch;
}
img {
  max-height: 12rem;
}
</style>

<div class="row">
  <div class="mr">
    <div class="w">
      <Textfield bind:value={name} label="Name" input$autofocus />
    </div>

    <div>
      <Textfield bind:value={role} label="Role" />
    </div>

    <div>
      <Textfield bind:value={number} label="Number" />
    </div>

    <div>
      <Textfield bind:value={email} label="Email" />
    </div>

    
  </div>

  <section class="mdc-elevation--z3 row grow p">
    <img src={`glyph1.png`} alt="logo">

    <div>
      <div>
        {name}
      </div>
      <div>
        {role}
      </div>
      <div>
        {number} | {email}
      </div>
    </div>
  </section>
</div>

