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
:global(body) {
  margin: 3rem;
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
  max-height: 9rem;
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
.sil-font {
  font-family: 'Source Sans Pro';
}
</style>

<div class="row">
  <section class="mr input-width">
    <div>
      <Textfield bind:value={name} label="Name" input$autofocus class="mdc-text-field--fullwidth" />
    </div>

    <div>
      <Textfield bind:value={role} label="Role" class="mdc-text-field--fullwidth" />
    </div>

    <div>
      <Textfield bind:value={number} label="Number" class="mdc-text-field--fullwidth" />
    </div>

    <div>
      <Textfield bind:value={email} label="Email" class="mdc-text-field--fullwidth" />
    </div>

    <div>
      {#each [...Array(5).keys()] as i}
        <FormField>
          <Radio bind:group={glyph} value={`${i + 1}`} />
          <span slot="label"><img src={`glyph${i + 1}.png`} alt={`glyph${i + 1}-logo`} class="thumbnail"></span>
        </FormField>
      {/each}
    </div>

    <!-- TODO: social links -->
  </section>

  <section class="mdc-elevation--z3 row grow p">
    <img src={`glyph${glyph}.png`} alt="logo">

    <div class="sil-font">
      <div class="mdc-typography--headline3">
        {name}
      </div>
      <div class="mdc-typography--subtitle1">
        {role}
      </div>
      <div class="mdc-typography--subtitle2">
        {number}
        {#if number && email}
          <span class="px">{number && email && '|'}</span>
        {/if}
        {email}
      </div>
    </div>
  </section>
</div>

