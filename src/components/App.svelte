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

.row {
  display: flex;
  flex-direction: row;
  align-items: center;
}
.mr {
  margin-right: 2rem;
}
img {
  max-height: 12rem;
}
</style>

<div class="row">
  <div class="mr">
    <div>
      <Textfield bind:value={name} label="Name" /> <!-- TODO: autofocus? -->
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

  <section class="mdc-elevation--z3 row">
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

