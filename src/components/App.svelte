<script>
import Textfield from '@smui/textfield'
import Radio from '@smui/radio'
import FormField from '@smui/form-field'

let name = 'Billy Clark'
let role = 'GTIS Application Developer'
let number = '704-491-6396'
let email = 'billy_clark@sil.org'
let glyph = '1'
</script>

<style>
/* TODO: source sans pro */
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

    <div>
      Glyphs:
      <FormField>
        <Radio bind:group={glyph} value="1" />
        <span slot="label">1</span>
      </FormField>
      <FormField>
        <Radio bind:group={glyph} value="2" />
        <span slot="label">2</span>
      </FormField>
      <FormField>
        <Radio bind:group={glyph} value="3" />
        <span slot="label">3</span>
      </FormField>
      <FormField>
        <Radio bind:group={glyph} value="4" />
        <span slot="label">4</span>
      </FormField>
      <FormField>
        <Radio bind:group={glyph} value="5" />
        <span slot="label">5</span>
      </FormField>
    </div>
  </div>

  <section class="mdc-elevation--z3 row grow p">
    <img src={`glyph${glyph}.png`} alt="logo">

    <div>
      <div>
        {name}
      </div>
      <div>
        {role}
      </div>
      <div>
        {number} <span>{number && email && '|'}</span> {email}
      </div>
    </div>
  </section>
</div>

