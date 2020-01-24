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
.input-width {
  width: 50ch;
}
img {
  max-height: 12rem;
}
.thumbnail {
  max-height: 3rem;
}
section.input-width div {
  padding-bottom: 1rem;
}
.px {
  padding-left: 0.5rem;
  padding-right: 0.5rem;
}
</style>

<div class="row">
  <section class="mr input-width">
    <div>
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
      <!-- TODO: use an #each here -->
      <FormField>
        <Radio bind:group={glyph} value="1" />
        <span slot="label"><img src={`glyph1.png`} alt="glyph1-logo" class="thumbnail"></span>
      </FormField>
      <FormField>
        <Radio bind:group={glyph} value="2" />
        <span slot="label"><img src={`glyph2.png`} alt="glyph2-logo" class="thumbnail"></span>
      </FormField>
      <FormField>
        <Radio bind:group={glyph} value="3" />
        <span slot="label"><img src={`glyph3.png`} alt="glyph3-logo" class="thumbnail"></span>
      </FormField>
      <FormField>
        <Radio bind:group={glyph} value="4" />
        <span slot="label"><img src={`glyph4.png`} alt="glyph4-logo" class="thumbnail"></span>
      </FormField>
      <FormField>
        <Radio bind:group={glyph} value="5" />
        <span slot="label"><img src={`glyph5.png`} alt="glyph5-logo" class="thumbnail"></span>
      </FormField>
    </div>

    <!-- TODO: social links -->
  </section>

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
        {number}
        <span class="px">{number && email && '|'}</span>
        {email}
      </div>
    </div>
  </section>
</div>

