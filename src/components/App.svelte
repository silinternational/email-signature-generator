<script>
import Textfield from '@smui/textfield'
import Radio from '@smui/radio'
import FormField from '@smui/form-field'

let name = 'Billy Clark'
let role = 'GTIS Application Developer'
let number = '704-491-6396'
let email = 'billy_clark@sil.org'
let glyph = '1'

const NUM_GLYPHS = 5
</script>

<style>
:global(body) {
  margin: 3rem;
}
:global(label) {
  width: 100%;
}

.mr {
  margin-right: 2rem;
}
.pb {
  padding-bottom: 1rem;
}
.row {
  display: flex;
  flex-direction: row;
  align-items: center;
}
.grow {
  flex-grow: 1;
}
.input-width {
  width: 50ch;
}
.thumbnail {
  max-height: 3rem;
}
</style>

<div class="row">
  <section class="mr input-width">
    <div class="pb">
      <Textfield bind:value={name} label="Name" input$autofocus variant="outlined" />
    </div>

    <div class="pb">
      <Textfield bind:value={role} label="Role" variant="outlined" />
    </div>

    <div class="pb">
      <Textfield bind:value={number} label="Number" variant="outlined" />
    </div>

    <div class="pb">
      <Textfield bind:value={email} label="Email" variant="outlined" />
    </div>

    <div>
      {#each [...Array(NUM_GLYPHS).keys()] as i}
        <FormField>
          <Radio bind:group={glyph} value={`${i + 1}`} />
          <span slot="label"><img src={`glyph${i + 1}.png`} alt={`glyph${i + 1}-logo`} class="thumbnail"></span>
        </FormField>
      {/each}
    </div>

    <!-- TODO: social links -->
    <!-- TODO: tz selector? -->
    <!-- TODO: still need each vendor instructions (check doc) -->
  </section>

  <section class="mdc-elevation--z3 grow">
    <table style="padding: 2rem">
      <tr>
        <td>
          <img src={`glyph${glyph}.png`} alt={`glyph${glyph} and logo`} style="max-height: 9rem">
        </td>
        <td style="font-family: 'Source Sans Pro';">
          <div style="color: #0b5e97; font-size: xx-large; padding-bottom: 2rem;">{name}</div>
          <div>{role}</div>
          <div>
            {number}
            {#if number && email}
              <span style="padding-left: 0.5rem; padding-right: 0.5rem;">|</span>
            {/if}
            {email}
          </div>
        </td>
      </tr>
    </table>
  </section>
</div>

